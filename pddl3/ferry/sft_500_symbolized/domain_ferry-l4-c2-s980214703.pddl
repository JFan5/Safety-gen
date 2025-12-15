(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v4)
		(pred_1 ?v8)
		(pred_6 ?v7)
		(pred_5 ?v7)
		(pred_4 ?v8 ?v7)
		(pred_3)
		(pred_2 ?v8))

   (:action op_2
       :parameters  (?v1 ?v6)
       :precondition (and (not-eq ?v1 ?v6) 
                          (pred_6 ?v1) (pred_6 ?v6) (pred_5 ?v1))
       :effect (and  (pred_5 ?v6)
		     (not (pred_5 ?v1))))


   (:action op_1
       :parameters (?v5 ?v2)
       :precondition  (and  (pred_1 ?v5) (pred_6 ?v2)
			    (pred_4 ?v5 ?v2) (pred_5 ?v2) (pred_3))
       :effect (and (pred_2 ?v5)
		    (not (pred_4 ?v5 ?v2)) 
		    (not (pred_3))))

   (:action op_3
       :parameters  (?v5  ?v2)
       :precondition  (and  (pred_1 ?v5) (pred_6 ?v2)
			    (pred_2 ?v5) (pred_5 ?v2))
       :effect (and (pred_4 ?v5 ?v2)
		    (pred_3)
		    (not (pred_2 ?v5)))))
