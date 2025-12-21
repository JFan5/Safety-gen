(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v5)
		(pred_1 ?v7)
		(pred_3 ?v4)
		(pred_4 ?v4)
		(pred_6 ?v7 ?v4)
		(pred_5)
		(pred_2 ?v7))

   (:action op_1
       :parameters  (?v3 ?v1)
       :precondition (and (not-eq ?v3 ?v1) 
                          (pred_3 ?v3) (pred_3 ?v1) (pred_4 ?v3))
       :effect (and  (pred_4 ?v1)
		     (not (pred_4 ?v3))))


   (:action op_3
       :parameters (?v6 ?v2)
       :precondition  (and  (pred_1 ?v6) (pred_3 ?v2)
			    (pred_6 ?v6 ?v2) (pred_4 ?v2) (pred_5))
       :effect (and (pred_2 ?v6)
		    (not (pred_6 ?v6 ?v2)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v6  ?v2)
       :precondition  (and  (pred_1 ?v6) (pred_3 ?v2)
			    (pred_2 ?v6) (pred_4 ?v2))
       :effect (and (pred_6 ?v6 ?v2)
		    (pred_5)
		    (not (pred_2 ?v6)))))
