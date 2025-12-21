(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v2)
		(pred_1 ?v1)
		(pred_3 ?v3)
		(pred_2 ?v3)
		(pred_6 ?v1 ?v3)
		(pred_4)
		(pred_5 ?v1))

   (:action op_1
       :parameters  (?v8 ?v4)
       :precondition (and (not-eq ?v8 ?v4) 
                          (pred_3 ?v8) (pred_3 ?v4) (pred_2 ?v8))
       :effect (and  (pred_2 ?v4)
		     (not (pred_2 ?v8))))


   (:action op_3
       :parameters (?v7 ?v6)
       :precondition  (and  (pred_1 ?v7) (pred_3 ?v6)
			    (pred_6 ?v7 ?v6) (pred_2 ?v6) (pred_4))
       :effect (and (pred_5 ?v7)
		    (not (pred_6 ?v7 ?v6)) 
		    (not (pred_4))))

   (:action op_2
       :parameters  (?v7  ?v6)
       :precondition  (and  (pred_1 ?v7) (pred_3 ?v6)
			    (pred_5 ?v7) (pred_2 ?v6))
       :effect (and (pred_6 ?v7 ?v6)
		    (pred_4)
		    (not (pred_5 ?v7)))))
