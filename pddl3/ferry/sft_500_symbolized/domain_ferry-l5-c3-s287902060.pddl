(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v1)
		(pred_1 ?v7)
		(pred_5 ?v2)
		(pred_6 ?v2)
		(pred_3 ?v7 ?v2)
		(pred_4)
		(pred_2 ?v7))

   (:action op_1
       :parameters  (?v8 ?v3)
       :precondition (and (not-eq ?v8 ?v3) 
                          (pred_5 ?v8) (pred_5 ?v3) (pred_6 ?v8))
       :effect (and  (pred_6 ?v3)
		     (not (pred_6 ?v8))))


   (:action op_2
       :parameters (?v6 ?v4)
       :precondition  (and  (pred_1 ?v6) (pred_5 ?v4)
			    (pred_3 ?v6 ?v4) (pred_6 ?v4) (pred_4))
       :effect (and (pred_2 ?v6)
		    (not (pred_3 ?v6 ?v4)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v6  ?v4)
       :precondition  (and  (pred_1 ?v6) (pred_5 ?v4)
			    (pred_2 ?v6) (pred_6 ?v4))
       :effect (and (pred_3 ?v6 ?v4)
		    (pred_4)
		    (not (pred_2 ?v6)))))
