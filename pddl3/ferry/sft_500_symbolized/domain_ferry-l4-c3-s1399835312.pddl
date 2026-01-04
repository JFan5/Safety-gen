(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v2)
		(pred_1 ?v1)
		(pred_5 ?v3)
		(pred_2 ?v3)
		(pred_3 ?v1 ?v3)
		(pred_4)
		(pred_6 ?v1))

   (:action op_1
       :parameters  (?v4 ?v5)
       :precondition (and (not-eq ?v4 ?v5) 
                          (pred_5 ?v4) (pred_5 ?v5) (pred_2 ?v4))
       :effect (and  (pred_2 ?v5)
		     (not (pred_2 ?v4))))


   (:action op_2
       :parameters (?v6 ?v7)
       :precondition  (and  (pred_1 ?v6) (pred_5 ?v7)
			    (pred_3 ?v6 ?v7) (pred_2 ?v7) (pred_4))
       :effect (and (pred_6 ?v6)
		    (not (pred_3 ?v6 ?v7)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v6  ?v7)
       :precondition  (and  (pred_1 ?v6) (pred_5 ?v7)
			    (pred_6 ?v6) (pred_2 ?v7))
       :effect (and (pred_3 ?v6 ?v7)
		    (pred_4)
		    (not (pred_6 ?v6)))))
