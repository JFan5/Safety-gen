(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v3)
		(pred_4 ?v8)
		(pred_3 ?v4)
		(pred_2 ?v4)
		(pred_6 ?v8 ?v4)
		(pred_5)
		(pred_1 ?v8))

   (:action op_2
       :parameters  (?v1 ?v5)
       :precondition (and (not-eq ?v1 ?v5) 
                          (pred_3 ?v1) (pred_3 ?v5) (pred_2 ?v1))
       :effect (and  (pred_2 ?v5)
		     (not (pred_2 ?v1))))


   (:action op_1
       :parameters (?v6 ?v2)
       :precondition  (and  (pred_4 ?v6) (pred_3 ?v2)
			    (pred_6 ?v6 ?v2) (pred_2 ?v2) (pred_5))
       :effect (and (pred_1 ?v6)
		    (not (pred_6 ?v6 ?v2)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v6  ?v2)
       :precondition  (and  (pred_4 ?v6) (pred_3 ?v2)
			    (pred_1 ?v6) (pred_2 ?v2))
       :effect (and (pred_6 ?v6 ?v2)
		    (pred_5)
		    (not (pred_1 ?v6)))))
