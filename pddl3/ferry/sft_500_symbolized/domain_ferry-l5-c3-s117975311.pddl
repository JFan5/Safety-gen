(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v8)
		(pred_2 ?v4)
		(pred_5 ?v2)
		(pred_1 ?v2)
		(pred_6 ?v4 ?v2)
		(pred_4)
		(pred_3 ?v4))

   (:action op_3
       :parameters  (?v7 ?v6)
       :precondition (and (not-eq ?v7 ?v6) 
                          (pred_5 ?v7) (pred_5 ?v6) (pred_1 ?v7))
       :effect (and  (pred_1 ?v6)
		     (not (pred_1 ?v7))))


   (:action op_1
       :parameters (?v1 ?v3)
       :precondition  (and  (pred_2 ?v1) (pred_5 ?v3)
			    (pred_6 ?v1 ?v3) (pred_1 ?v3) (pred_4))
       :effect (and (pred_3 ?v1)
		    (not (pred_6 ?v1 ?v3)) 
		    (not (pred_4))))

   (:action op_2
       :parameters  (?v1  ?v3)
       :precondition  (and  (pred_2 ?v1) (pred_5 ?v3)
			    (pred_3 ?v1) (pred_1 ?v3))
       :effect (and (pred_6 ?v1 ?v3)
		    (pred_4)
		    (not (pred_3 ?v1)))))
