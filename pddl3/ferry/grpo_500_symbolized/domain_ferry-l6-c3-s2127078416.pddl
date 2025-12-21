(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v4)
		(pred_4 ?v7)
		(pred_3 ?v2)
		(pred_1 ?v2)
		(pred_2 ?v7 ?v2)
		(pred_6)
		(pred_5 ?v7))

   (:action op_2
       :parameters  (?v6 ?v1)
       :precondition (and (not-eq ?v6 ?v1) 
                          (pred_3 ?v6) (pred_3 ?v1) (pred_1 ?v6))
       :effect (and  (pred_1 ?v1)
		     (not (pred_1 ?v6))))


   (:action op_3
       :parameters (?v5 ?v8)
       :precondition  (and  (pred_4 ?v5) (pred_3 ?v8)
			    (pred_2 ?v5 ?v8) (pred_1 ?v8) (pred_6))
       :effect (and (pred_5 ?v5)
		    (not (pred_2 ?v5 ?v8)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v5  ?v8)
       :precondition  (and  (pred_4 ?v5) (pred_3 ?v8)
			    (pred_5 ?v5) (pred_1 ?v8))
       :effect (and (pred_2 ?v5 ?v8)
		    (pred_6)
		    (not (pred_5 ?v5)))))
