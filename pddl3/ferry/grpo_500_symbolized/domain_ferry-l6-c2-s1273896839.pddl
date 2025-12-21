(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v2)
		(pred_5 ?v1)
		(pred_6 ?v4)
		(pred_3 ?v4)
		(pred_1 ?v1 ?v4)
		(pred_4)
		(pred_2 ?v1))

   (:action op_1
       :parameters  (?v7 ?v8)
       :precondition (and (not-eq ?v7 ?v8) 
                          (pred_6 ?v7) (pred_6 ?v8) (pred_3 ?v7))
       :effect (and  (pred_3 ?v8)
		     (not (pred_3 ?v7))))


   (:action op_3
       :parameters (?v5 ?v3)
       :precondition  (and  (pred_5 ?v5) (pred_6 ?v3)
			    (pred_1 ?v5 ?v3) (pred_3 ?v3) (pred_4))
       :effect (and (pred_2 ?v5)
		    (not (pred_1 ?v5 ?v3)) 
		    (not (pred_4))))

   (:action op_2
       :parameters  (?v5  ?v3)
       :precondition  (and  (pred_5 ?v5) (pred_6 ?v3)
			    (pred_2 ?v5) (pred_3 ?v3))
       :effect (and (pred_1 ?v5 ?v3)
		    (pred_4)
		    (not (pred_2 ?v5)))))
