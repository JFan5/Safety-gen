(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v4)
		(pred_2 ?v3)
		(pred_4 ?v7)
		(pred_6 ?v7)
		(pred_3 ?v3 ?v7)
		(pred_5)
		(pred_1 ?v3))

   (:action op_2
       :parameters  (?v5 ?v6)
       :precondition (and (not-eq ?v5 ?v6) 
                          (pred_4 ?v5) (pred_4 ?v6) (pred_6 ?v5))
       :effect (and  (pred_6 ?v6)
		     (not (pred_6 ?v5))))


   (:action op_1
       :parameters (?v1 ?v2)
       :precondition  (and  (pred_2 ?v1) (pred_4 ?v2)
			    (pred_3 ?v1 ?v2) (pred_6 ?v2) (pred_5))
       :effect (and (pred_1 ?v1)
		    (not (pred_3 ?v1 ?v2)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v1  ?v2)
       :precondition  (and  (pred_2 ?v1) (pred_4 ?v2)
			    (pred_1 ?v1) (pred_6 ?v2))
       :effect (and (pred_3 ?v1 ?v2)
		    (pred_5)
		    (not (pred_1 ?v1)))))
