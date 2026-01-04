(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v2)
		(pred_6 ?v8)
		(pred_4 ?v3)
		(pred_5 ?v3)
		(pred_2 ?v8 ?v3)
		(pred_3)
		(pred_1 ?v8))

   (:action op_2
       :parameters  (?v1 ?v4)
       :precondition (and (not-eq ?v1 ?v4) 
                          (pred_4 ?v1) (pred_4 ?v4) (pred_5 ?v1))
       :effect (and  (pred_5 ?v4)
		     (not (pred_5 ?v1))))


   (:action op_3
       :parameters (?v6 ?v7)
       :precondition  (and  (pred_6 ?v6) (pred_4 ?v7)
			    (pred_2 ?v6 ?v7) (pred_5 ?v7) (pred_3))
       :effect (and (pred_1 ?v6)
		    (not (pred_2 ?v6 ?v7)) 
		    (not (pred_3))))

   (:action op_1
       :parameters  (?v6  ?v7)
       :precondition  (and  (pred_6 ?v6) (pred_4 ?v7)
			    (pred_1 ?v6) (pred_5 ?v7))
       :effect (and (pred_2 ?v6 ?v7)
		    (pred_3)
		    (not (pred_1 ?v6)))))
