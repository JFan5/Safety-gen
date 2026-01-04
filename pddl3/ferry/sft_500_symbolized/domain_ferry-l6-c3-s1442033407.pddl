(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v8)
		(pred_2 ?v6)
		(pred_4 ?v4)
		(pred_6 ?v4)
		(pred_5 ?v6 ?v4)
		(pred_3)
		(pred_1 ?v6))

   (:action op_1
       :parameters  (?v3 ?v1)
       :precondition (and (not-eq ?v3 ?v1) 
                          (pred_4 ?v3) (pred_4 ?v1) (pred_6 ?v3))
       :effect (and  (pred_6 ?v1)
		     (not (pred_6 ?v3))))


   (:action op_3
       :parameters (?v2 ?v7)
       :precondition  (and  (pred_2 ?v2) (pred_4 ?v7)
			    (pred_5 ?v2 ?v7) (pred_6 ?v7) (pred_3))
       :effect (and (pred_1 ?v2)
		    (not (pred_5 ?v2 ?v7)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v2  ?v7)
       :precondition  (and  (pred_2 ?v2) (pred_4 ?v7)
			    (pred_1 ?v2) (pred_6 ?v7))
       :effect (and (pred_5 ?v2 ?v7)
		    (pred_3)
		    (not (pred_1 ?v2)))))
