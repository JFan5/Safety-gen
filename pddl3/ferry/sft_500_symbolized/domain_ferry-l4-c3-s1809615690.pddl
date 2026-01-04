(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v5)
		(pred_1 ?v6)
		(pred_3 ?v4)
		(pred_6 ?v4)
		(pred_2 ?v6 ?v4)
		(pred_4)
		(pred_5 ?v6))

   (:action op_3
       :parameters  (?v3 ?v8)
       :precondition (and (not-eq ?v3 ?v8) 
                          (pred_3 ?v3) (pred_3 ?v8) (pred_6 ?v3))
       :effect (and  (pred_6 ?v8)
		     (not (pred_6 ?v3))))


   (:action op_1
       :parameters (?v7 ?v1)
       :precondition  (and  (pred_1 ?v7) (pred_3 ?v1)
			    (pred_2 ?v7 ?v1) (pred_6 ?v1) (pred_4))
       :effect (and (pred_5 ?v7)
		    (not (pred_2 ?v7 ?v1)) 
		    (not (pred_4))))

   (:action op_2
       :parameters  (?v7  ?v1)
       :precondition  (and  (pred_1 ?v7) (pred_3 ?v1)
			    (pred_5 ?v7) (pred_6 ?v1))
       :effect (and (pred_2 ?v7 ?v1)
		    (pred_4)
		    (not (pred_5 ?v7)))))
