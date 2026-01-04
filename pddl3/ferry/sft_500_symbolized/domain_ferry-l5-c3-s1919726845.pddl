(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v5)
		(pred_5 ?v2)
		(pred_6 ?v1)
		(pred_3 ?v1)
		(pred_1 ?v2 ?v1)
		(pred_4)
		(pred_2 ?v2))

   (:action op_3
       :parameters  (?v4 ?v8)
       :precondition (and (not-eq ?v4 ?v8) 
                          (pred_6 ?v4) (pred_6 ?v8) (pred_3 ?v4))
       :effect (and  (pred_3 ?v8)
		     (not (pred_3 ?v4))))


   (:action op_1
       :parameters (?v6 ?v7)
       :precondition  (and  (pred_5 ?v6) (pred_6 ?v7)
			    (pred_1 ?v6 ?v7) (pred_3 ?v7) (pred_4))
       :effect (and (pred_2 ?v6)
		    (not (pred_1 ?v6 ?v7)) 
		    (not (pred_4))))

   (:action op_2
       :parameters  (?v6  ?v7)
       :precondition  (and  (pred_5 ?v6) (pred_6 ?v7)
			    (pred_2 ?v6) (pred_3 ?v7))
       :effect (and (pred_1 ?v6 ?v7)
		    (pred_4)
		    (not (pred_2 ?v6)))))
