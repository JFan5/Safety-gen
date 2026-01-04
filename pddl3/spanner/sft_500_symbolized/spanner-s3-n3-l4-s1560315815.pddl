; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1560315815 --problem-name spanner-s3-n3-l4-s1560315815
(define (problem spanner-s3-n3-l4-s1560315815)
 (:domain spanner)
 (:objects 
     obj_05 - type_1
     obj_09 obj_01 obj_06 - type_5
     obj_07 obj_03 obj_10 - type_4
     obj_02 obj_11 obj_04 obj_12 - type_2
     obj_13 obj_08 - type_2
    )
 (:init 
    (pred_5 obj_05 obj_13)
    (pred_5 obj_09 obj_12)
    (pred_4 obj_09)
    (pred_5 obj_01 obj_12)
    (pred_4 obj_01)
    (pred_5 obj_06 obj_12)
    (pred_4 obj_06)
    (pred_6 obj_07)
    (pred_5 obj_07 obj_08)
    (pred_6 obj_03)
    (pred_5 obj_03 obj_08)
    (pred_6 obj_10)
    (pred_5 obj_10 obj_08)
    (pred_3 obj_13 obj_02)
    (pred_3 obj_12 obj_08)
    (pred_3 obj_02 obj_11)
    (pred_3 obj_11 obj_04)
    (pred_3 obj_04 obj_12)
)
 (:goal
  (and
   (pred_2 obj_07)
   (pred_2 obj_03)
   (pred_2 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_03)) (not (pred_2 obj_10))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_13)))
  )
)
)
