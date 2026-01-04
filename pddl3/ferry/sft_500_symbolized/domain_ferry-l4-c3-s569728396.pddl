(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v5)
		(pred_2 ?v4)
		(pred_4 ?v3)
		(pred_3 ?v3)
		(pred_6 ?v4 ?v3)
		(pred_5)
		(pred_1 ?v4))

   (:action op_2
       :parameters  (?v8 ?v2)
       :precondition (and (not-eq ?v8 ?v2) 
                          (pred_4 ?v8) (pred_4 ?v2) (pred_3 ?v8))
       :effect (and  (pred_3 ?v2)
		     (not (pred_3 ?v8))))


   (:action op_3
       :parameters (?v7 ?v6)
       :precondition  (and  (pred_2 ?v7) (pred_4 ?v6)
			    (pred_6 ?v7 ?v6) (pred_3 ?v6) (pred_5))
       :effect (and (pred_1 ?v7)
		    (not (pred_6 ?v7 ?v6)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v7  ?v6)
       :precondition  (and  (pred_2 ?v7) (pred_4 ?v6)
			    (pred_1 ?v7) (pred_3 ?v6))
       :effect (and (pred_6 ?v7 ?v6)
		    (pred_5)
		    (not (pred_1 ?v7)))))
