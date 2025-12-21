(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v1)
		(pred_2 ?v4)
		(pred_5 ?v5)
		(pred_4 ?v5)
		(pred_3 ?v4 ?v5)
		(pred_6)
		(pred_1 ?v4))

   (:action op_1
       :parameters  (?v8 ?v2)
       :precondition (and (not-eq ?v8 ?v2) 
                          (pred_5 ?v8) (pred_5 ?v2) (pred_4 ?v8))
       :effect (and  (pred_4 ?v2)
		     (not (pred_4 ?v8))))


   (:action op_2
       :parameters (?v6 ?v7)
       :precondition  (and  (pred_2 ?v6) (pred_5 ?v7)
			    (pred_3 ?v6 ?v7) (pred_4 ?v7) (pred_6))
       :effect (and (pred_1 ?v6)
		    (not (pred_3 ?v6 ?v7)) 
		    (not (pred_6))))

   (:action op_3
       :parameters  (?v6  ?v7)
       :precondition  (and  (pred_2 ?v6) (pred_5 ?v7)
			    (pred_1 ?v6) (pred_4 ?v7))
       :effect (and (pred_3 ?v6 ?v7)
		    (pred_6)
		    (not (pred_1 ?v6)))))
