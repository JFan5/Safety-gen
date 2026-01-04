(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v7)
		(pred_6 ?v8)
		(pred_5 ?v5)
		(pred_2 ?v5)
		(pred_1 ?v8 ?v5)
		(pred_3)
		(pred_4 ?v8))

   (:action op_1
       :parameters  (?v3 ?v2)
       :precondition (and (not-eq ?v3 ?v2) 
                          (pred_5 ?v3) (pred_5 ?v2) (pred_2 ?v3))
       :effect (and  (pred_2 ?v2)
		     (not (pred_2 ?v3))))


   (:action op_3
       :parameters (?v1 ?v4)
       :precondition  (and  (pred_6 ?v1) (pred_5 ?v4)
			    (pred_1 ?v1 ?v4) (pred_2 ?v4) (pred_3))
       :effect (and (pred_4 ?v1)
		    (not (pred_1 ?v1 ?v4)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v1  ?v4)
       :precondition  (and  (pred_6 ?v1) (pred_5 ?v4)
			    (pred_4 ?v1) (pred_2 ?v4))
       :effect (and (pred_1 ?v1 ?v4)
		    (pred_3)
		    (not (pred_4 ?v1)))))
