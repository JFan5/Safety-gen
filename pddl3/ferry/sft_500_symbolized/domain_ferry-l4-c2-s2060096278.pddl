(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v5)
		(pred_1 ?v4)
		(pred_6 ?v6)
		(pred_3 ?v6)
		(pred_5 ?v4 ?v6)
		(pred_4)
		(pred_2 ?v4))

   (:action op_2
       :parameters  (?v8 ?v2)
       :precondition (and (not-eq ?v8 ?v2) 
                          (pred_6 ?v8) (pred_6 ?v2) (pred_3 ?v8))
       :effect (and  (pred_3 ?v2)
		     (not (pred_3 ?v8))))


   (:action op_1
       :parameters (?v7 ?v1)
       :precondition  (and  (pred_1 ?v7) (pred_6 ?v1)
			    (pred_5 ?v7 ?v1) (pred_3 ?v1) (pred_4))
       :effect (and (pred_2 ?v7)
		    (not (pred_5 ?v7 ?v1)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v7  ?v1)
       :precondition  (and  (pred_1 ?v7) (pred_6 ?v1)
			    (pred_2 ?v7) (pred_3 ?v1))
       :effect (and (pred_5 ?v7 ?v1)
		    (pred_4)
		    (not (pred_2 ?v7)))))
