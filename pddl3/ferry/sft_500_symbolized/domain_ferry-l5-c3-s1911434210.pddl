(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v3)
		(pred_5 ?v4)
		(pred_6 ?v5)
		(pred_2 ?v5)
		(pred_3 ?v4 ?v5)
		(pred_4)
		(pred_1 ?v4))

   (:action op_1
       :parameters  (?v1 ?v8)
       :precondition (and (not-eq ?v1 ?v8) 
                          (pred_6 ?v1) (pred_6 ?v8) (pred_2 ?v1))
       :effect (and  (pred_2 ?v8)
		     (not (pred_2 ?v1))))


   (:action op_3
       :parameters (?v6 ?v7)
       :precondition  (and  (pred_5 ?v6) (pred_6 ?v7)
			    (pred_3 ?v6 ?v7) (pred_2 ?v7) (pred_4))
       :effect (and (pred_1 ?v6)
		    (not (pred_3 ?v6 ?v7)) 
		    (not (pred_4))))

   (:action op_2
       :parameters  (?v6  ?v7)
       :precondition  (and  (pred_5 ?v6) (pred_6 ?v7)
			    (pred_1 ?v6) (pred_2 ?v7))
       :effect (and (pred_3 ?v6 ?v7)
		    (pred_4)
		    (not (pred_1 ?v6)))))
