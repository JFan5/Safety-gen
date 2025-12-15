(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v5 ?v9)
             (pred_4 ?v1 ?v6)
             (pred_6 ?v5 ?v6)
             (pred_10 ?v10 ?v5 )
	     (pred_8 ?v5)
             (pred_2 ?v12)
             (pred_7 ?v1)
             (pred_3 ?v6)
             (pred_11 ?v5)
             (pred_5 ?v1)
             (pred_9 ?v5)
             (pred_12 ))



(:action op_3
:parameters (?v13 ?v11 ?v2 ?v8)
:precondition (and (pred_2 ?v13) (pred_2 ?v11) (pred_7 ?v2) (pred_3 ?v8)
          (pred_1 ?v13 ?v11) (pred_4 ?v2 ?v8)
                   (pred_6 ?v11 ?v8) (pred_8 ?v13) 
                   (pred_11 ?v11) (pred_5 ?v2))
:effect (and  (pred_9 ?v11) (not (pred_11 ?v11))))


(:action op_1
:parameters (?v13 ?v4)
:precondition (and (pred_2 ?v13) (pred_2 ?v4)
               (pred_8 ?v13) (pred_1 ?v13 ?v4) (pred_9 ?v4))
:effect (and (pred_8 ?v4) (not (pred_8 ?v13))))

(:action op_5
:parameters (?v13 ?v2)
:precondition (and (pred_2 ?v13) (pred_7 ?v2) 
                  (pred_8 ?v13) (pred_10 ?v2 ?v13) (pred_12 ))
:effect (and (pred_5 ?v2)
   (not (pred_10 ?v2 ?v13)) (not (pred_12 ))))


(:action op_4
:parameters (?v13 ?v3 ?v7)
:precondition (and (pred_2 ?v13) (pred_7 ?v3) (pred_7 ?v7)
                  (pred_8 ?v13) (pred_5 ?v7) (pred_10 ?v3 ?v13))
:effect (and (pred_5 ?v3) (pred_10 ?v7 ?v13)
        (not (pred_5 ?v7)) (not (pred_10 ?v3 ?v13))))

(:action op_2
:parameters (?v13 ?v2)
:precondition (and (pred_2 ?v13) (pred_7 ?v2) 
                  (pred_8 ?v13) (pred_5 ?v2))
:effect (and (pred_12 ) (pred_10 ?v2 ?v13) (not (pred_5 ?v2)))))


	
