(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v6)
		(pred_3 ?v8)
		(pred_6 ?v2)
		(pred_5 ?v2)
		(pred_2 ?v8 ?v2)
		(pred_1)
		(pred_4 ?v8))

   (:action op_3
       :parameters  (?v3 ?v4)
       :precondition (and (not-eq ?v3 ?v4) 
                          (pred_6 ?v3) (pred_6 ?v4) (pred_5 ?v3))
       :effect (and  (pred_5 ?v4)
		     (not (pred_5 ?v3))))


   (:action op_2
       :parameters (?v1 ?v7)
       :precondition  (and  (pred_3 ?v1) (pred_6 ?v7)
			    (pred_2 ?v1 ?v7) (pred_5 ?v7) (pred_1))
       :effect (and (pred_4 ?v1)
		    (not (pred_2 ?v1 ?v7)) 
		    (not (pred_1))))

   (:action op_1
       :parameters  (?v1  ?v7)
       :precondition  (and  (pred_3 ?v1) (pred_6 ?v7)
			    (pred_4 ?v1) (pred_5 ?v7))
       :effect (and (pred_2 ?v1 ?v7)
		    (pred_1)
		    (not (pred_4 ?v1)))))
