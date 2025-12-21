(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v5)
		(pred_5 ?v8)
		(pred_1 ?v3)
		(pred_6 ?v3)
		(pred_4 ?v8 ?v3)
		(pred_2)
		(pred_3 ?v8))

   (:action op_1
       :parameters  (?v7 ?v4)
       :precondition (and (not-eq ?v7 ?v4) 
                          (pred_1 ?v7) (pred_1 ?v4) (pred_6 ?v7))
       :effect (and  (pred_6 ?v4)
		     (not (pred_6 ?v7))))


   (:action op_3
       :parameters (?v1 ?v2)
       :precondition  (and  (pred_5 ?v1) (pred_1 ?v2)
			    (pred_4 ?v1 ?v2) (pred_6 ?v2) (pred_2))
       :effect (and (pred_3 ?v1)
		    (not (pred_4 ?v1 ?v2)) 
		    (not (pred_2))))

   (:action op_2
       :parameters  (?v1  ?v2)
       :precondition  (and  (pred_5 ?v1) (pred_1 ?v2)
			    (pred_3 ?v1) (pred_6 ?v2))
       :effect (and (pred_4 ?v1 ?v2)
		    (pred_2)
		    (not (pred_3 ?v1)))))
