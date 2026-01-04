(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v8)
		(pred_5 ?v4)
		(pred_6 ?v6)
		(pred_4 ?v6)
		(pred_1 ?v4 ?v6)
		(pred_2)
		(pred_3 ?v4))

   (:action op_3
       :parameters  (?v7 ?v3)
       :precondition (and (not-eq ?v7 ?v3) 
                          (pred_6 ?v7) (pred_6 ?v3) (pred_4 ?v7))
       :effect (and  (pred_4 ?v3)
		     (not (pred_4 ?v7))))


   (:action op_2
       :parameters (?v2 ?v1)
       :precondition  (and  (pred_5 ?v2) (pred_6 ?v1)
			    (pred_1 ?v2 ?v1) (pred_4 ?v1) (pred_2))
       :effect (and (pred_3 ?v2)
		    (not (pred_1 ?v2 ?v1)) 
		    (not (pred_2))))

   (:action op_1
       :parameters  (?v2  ?v1)
       :precondition  (and  (pred_5 ?v2) (pred_6 ?v1)
			    (pred_3 ?v2) (pred_4 ?v1))
       :effect (and (pred_1 ?v2 ?v1)
		    (pred_2)
		    (not (pred_3 ?v2)))))
