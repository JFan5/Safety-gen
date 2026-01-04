(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v6)
		(pred_6 ?v8)
		(pred_4 ?v1)
		(pred_5 ?v1)
		(pred_3 ?v8 ?v1)
		(pred_1)
		(pred_2 ?v8))

   (:action op_2
       :parameters  (?v5 ?v7)
       :precondition (and (not-eq ?v5 ?v7) 
                          (pred_4 ?v5) (pred_4 ?v7) (pred_5 ?v5))
       :effect (and  (pred_5 ?v7)
		     (not (pred_5 ?v5))))


   (:action op_3
       :parameters (?v3 ?v2)
       :precondition  (and  (pred_6 ?v3) (pred_4 ?v2)
			    (pred_3 ?v3 ?v2) (pred_5 ?v2) (pred_1))
       :effect (and (pred_2 ?v3)
		    (not (pred_3 ?v3 ?v2)) 
		    (not (pred_1))))

   (:action op_1
       :parameters  (?v3  ?v2)
       :precondition  (and  (pred_6 ?v3) (pred_4 ?v2)
			    (pred_2 ?v3) (pred_5 ?v2))
       :effect (and (pred_3 ?v3 ?v2)
		    (pred_1)
		    (not (pred_2 ?v3)))))
