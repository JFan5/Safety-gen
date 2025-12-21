(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v2)
		(pred_3 ?v3)
		(pred_5 ?v6)
		(pred_2 ?v6)
		(pred_6 ?v3 ?v6)
		(pred_1)
		(pred_4 ?v3))

   (:action op_1
       :parameters  (?v8 ?v5)
       :precondition (and (not-eq ?v8 ?v5) 
                          (pred_5 ?v8) (pred_5 ?v5) (pred_2 ?v8))
       :effect (and  (pred_2 ?v5)
		     (not (pred_2 ?v8))))


   (:action op_2
       :parameters (?v7 ?v4)
       :precondition  (and  (pred_3 ?v7) (pred_5 ?v4)
			    (pred_6 ?v7 ?v4) (pred_2 ?v4) (pred_1))
       :effect (and (pred_4 ?v7)
		    (not (pred_6 ?v7 ?v4)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v7  ?v4)
       :precondition  (and  (pred_3 ?v7) (pred_5 ?v4)
			    (pred_4 ?v7) (pred_2 ?v4))
       :effect (and (pred_6 ?v7 ?v4)
		    (pred_1)
		    (not (pred_4 ?v7)))))
