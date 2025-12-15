(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v3)
		(pred_4 ?v7)
		(pred_2 ?v1)
		(pred_1 ?v1)
		(pred_3 ?v7 ?v1)
		(pred_6)
		(pred_5 ?v7))

   (:action op_1
       :parameters  (?v8 ?v2)
       :precondition (and (not-eq ?v8 ?v2) 
                          (pred_2 ?v8) (pred_2 ?v2) (pred_1 ?v8))
       :effect (and  (pred_1 ?v2)
		     (not (pred_1 ?v8))))


   (:action op_3
       :parameters (?v6 ?v5)
       :precondition  (and  (pred_4 ?v6) (pred_2 ?v5)
			    (pred_3 ?v6 ?v5) (pred_1 ?v5) (pred_6))
       :effect (and (pred_5 ?v6)
		    (not (pred_3 ?v6 ?v5)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v6  ?v5)
       :precondition  (and  (pred_4 ?v6) (pred_2 ?v5)
			    (pred_5 ?v6) (pred_1 ?v5))
       :effect (and (pred_3 ?v6 ?v5)
		    (pred_6)
		    (not (pred_5 ?v6)))))
