(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v2)
		(pred_1 ?v3)
		(pred_4 ?v4)
		(pred_6 ?v4)
		(pred_5 ?v3 ?v4)
		(pred_2)
		(pred_3 ?v3))

   (:action op_3
       :parameters  (?v5 ?v7)
       :precondition (and (not-eq ?v5 ?v7) 
                          (pred_4 ?v5) (pred_4 ?v7) (pred_6 ?v5))
       :effect (and  (pred_6 ?v7)
		     (not (pred_6 ?v5))))


   (:action op_2
       :parameters (?v6 ?v1)
       :precondition  (and  (pred_1 ?v6) (pred_4 ?v1)
			    (pred_5 ?v6 ?v1) (pred_6 ?v1) (pred_2))
       :effect (and (pred_3 ?v6)
		    (not (pred_5 ?v6 ?v1)) 
		    (not (pred_2))))

   (:action op_1
       :parameters  (?v6  ?v1)
       :precondition  (and  (pred_1 ?v6) (pred_4 ?v1)
			    (pred_3 ?v6) (pred_6 ?v1))
       :effect (and (pred_5 ?v6 ?v1)
		    (pred_2)
		    (not (pred_3 ?v6)))))
