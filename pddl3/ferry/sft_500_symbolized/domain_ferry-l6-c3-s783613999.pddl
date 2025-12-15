(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v1)
		(pred_3 ?v7)
		(pred_2 ?v5)
		(pred_5 ?v5)
		(pred_4 ?v7 ?v5)
		(pred_6)
		(pred_1 ?v7))

   (:action op_1
       :parameters  (?v8 ?v6)
       :precondition (and (not-eq ?v8 ?v6) 
                          (pred_2 ?v8) (pred_2 ?v6) (pred_5 ?v8))
       :effect (and  (pred_5 ?v6)
		     (not (pred_5 ?v8))))


   (:action op_2
       :parameters (?v2 ?v3)
       :precondition  (and  (pred_3 ?v2) (pred_2 ?v3)
			    (pred_4 ?v2 ?v3) (pred_5 ?v3) (pred_6))
       :effect (and (pred_1 ?v2)
		    (not (pred_4 ?v2 ?v3)) 
		    (not (pred_6))))

   (:action op_3
       :parameters  (?v2  ?v3)
       :precondition  (and  (pred_3 ?v2) (pred_2 ?v3)
			    (pred_1 ?v2) (pred_5 ?v3))
       :effect (and (pred_4 ?v2 ?v3)
		    (pred_6)
		    (not (pred_1 ?v2)))))
