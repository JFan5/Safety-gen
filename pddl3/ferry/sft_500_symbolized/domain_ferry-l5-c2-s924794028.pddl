(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v6)
		(pred_2 ?v3)
		(pred_4 ?v7)
		(pred_1 ?v7)
		(pred_3 ?v3 ?v7)
		(pred_5)
		(pred_6 ?v3))

   (:action op_3
       :parameters  (?v1 ?v5)
       :precondition (and (not-eq ?v1 ?v5) 
                          (pred_4 ?v1) (pred_4 ?v5) (pred_1 ?v1))
       :effect (and  (pred_1 ?v5)
		     (not (pred_1 ?v1))))


   (:action op_1
       :parameters (?v2 ?v4)
       :precondition  (and  (pred_2 ?v2) (pred_4 ?v4)
			    (pred_3 ?v2 ?v4) (pred_1 ?v4) (pred_5))
       :effect (and (pred_6 ?v2)
		    (not (pred_3 ?v2 ?v4)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v2  ?v4)
       :precondition  (and  (pred_2 ?v2) (pred_4 ?v4)
			    (pred_6 ?v2) (pred_1 ?v4))
       :effect (and (pred_3 ?v2 ?v4)
		    (pred_5)
		    (not (pred_6 ?v2)))))
