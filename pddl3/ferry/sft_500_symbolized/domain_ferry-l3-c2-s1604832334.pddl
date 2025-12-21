(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v4)
		(pred_4 ?v8)
		(pred_5 ?v7)
		(pred_3 ?v7)
		(pred_2 ?v8 ?v7)
		(pred_1)
		(pred_6 ?v8))

   (:action op_3
       :parameters  (?v5 ?v6)
       :precondition (and (not-eq ?v5 ?v6) 
                          (pred_5 ?v5) (pred_5 ?v6) (pred_3 ?v5))
       :effect (and  (pred_3 ?v6)
		     (not (pred_3 ?v5))))


   (:action op_1
       :parameters (?v3 ?v2)
       :precondition  (and  (pred_4 ?v3) (pred_5 ?v2)
			    (pred_2 ?v3 ?v2) (pred_3 ?v2) (pred_1))
       :effect (and (pred_6 ?v3)
		    (not (pred_2 ?v3 ?v2)) 
		    (not (pred_1))))

   (:action op_2
       :parameters  (?v3  ?v2)
       :precondition  (and  (pred_4 ?v3) (pred_5 ?v2)
			    (pred_6 ?v3) (pred_3 ?v2))
       :effect (and (pred_2 ?v3 ?v2)
		    (pred_1)
		    (not (pred_6 ?v3)))))
