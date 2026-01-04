; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1247200444 --problem-name spanner-s3-n3-l4-s1247200444
(define (problem spanner-s3-n3-l4-s1247200444)
 (:domain spanner)
 (:objects 
     obj_01 - type_2
     obj_07 obj_04 obj_10 - type_3
     obj_05 obj_03 obj_06 - type_5
     obj_09 obj_12 obj_02 obj_11 - type_1
     obj_13 obj_08 - type_1
    )
 (:init 
    (pred_5 obj_01 obj_13)
    (pred_5 obj_07 obj_02)
    (pred_1 obj_07)
    (pred_5 obj_04 obj_02)
    (pred_1 obj_04)
    (pred_5 obj_10 obj_09)
    (pred_1 obj_10)
    (pred_2 obj_05)
    (pred_5 obj_05 obj_08)
    (pred_2 obj_03)
    (pred_5 obj_03 obj_08)
    (pred_2 obj_06)
    (pred_5 obj_06 obj_08)
    (pred_4 obj_13 obj_09)
    (pred_4 obj_11 obj_08)
    (pred_4 obj_09 obj_12)
    (pred_4 obj_12 obj_02)
    (pred_4 obj_02 obj_11)
)
 (:goal
  (and
   (pred_3 obj_05)
   (pred_3 obj_03)
   (pred_3 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_03)) (not (pred_3 obj_06))))
    (forall (?m - type_2) (at-most-once (pred_5 ?m obj_13)))
  )
)
)
