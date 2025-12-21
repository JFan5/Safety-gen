(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v3)
		(pred_5 ?v1)
		(pred_1 ?v7)
		(pred_2 ?v7)
		(pred_3 ?v1 ?v7)
		(pred_4)
		(pred_6 ?v1))

   (:action op_1
       :parameters  (?v5 ?v8)
       :precondition (and (not-eq ?v5 ?v8) 
                          (pred_1 ?v5) (pred_1 ?v8) (pred_2 ?v5))
       :effect (and  (pred_2 ?v8)
		     (not (pred_2 ?v5))))


   (:action op_3
       :parameters (?v6 ?v4)
       :precondition  (and  (pred_5 ?v6) (pred_1 ?v4)
			    (pred_3 ?v6 ?v4) (pred_2 ?v4) (pred_4))
       :effect (and (pred_6 ?v6)
		    (not (pred_3 ?v6 ?v4)) 
		    (not (pred_4))))

   (:action op_2
       :parameters  (?v6  ?v4)
       :precondition  (and  (pred_5 ?v6) (pred_1 ?v4)
			    (pred_6 ?v6) (pred_2 ?v4))
       :effect (and (pred_3 ?v6 ?v4)
		    (pred_4)
		    (not (pred_6 ?v6)))))
