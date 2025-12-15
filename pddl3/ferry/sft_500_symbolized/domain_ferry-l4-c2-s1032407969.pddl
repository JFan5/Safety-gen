(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v5)
		(pred_6 ?v2)
		(pred_1 ?v8)
		(pred_5 ?v8)
		(pred_2 ?v2 ?v8)
		(pred_4)
		(pred_3 ?v2))

   (:action op_2
       :parameters  (?v1 ?v7)
       :precondition (and (not-eq ?v1 ?v7) 
                          (pred_1 ?v1) (pred_1 ?v7) (pred_5 ?v1))
       :effect (and  (pred_5 ?v7)
		     (not (pred_5 ?v1))))


   (:action op_1
       :parameters (?v6 ?v4)
       :precondition  (and  (pred_6 ?v6) (pred_1 ?v4)
			    (pred_2 ?v6 ?v4) (pred_5 ?v4) (pred_4))
       :effect (and (pred_3 ?v6)
		    (not (pred_2 ?v6 ?v4)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v6  ?v4)
       :precondition  (and  (pred_6 ?v6) (pred_1 ?v4)
			    (pred_3 ?v6) (pred_5 ?v4))
       :effect (and (pred_2 ?v6 ?v4)
		    (pred_4)
		    (not (pred_3 ?v6)))))
