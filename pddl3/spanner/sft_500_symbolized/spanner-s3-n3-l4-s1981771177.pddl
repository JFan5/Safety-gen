; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1981771177 --problem-name spanner-s3-n3-l4-s1981771177
(define (problem spanner-s3-n3-l4-s1981771177)
 (:domain spanner)
 (:objects 
     obj_05 - type_4
     obj_13 obj_02 obj_04 - type_5
     obj_03 obj_12 obj_08 - type_2
     obj_01 obj_07 obj_10 obj_06 - type_1
     obj_09 obj_11 - type_1
    )
 (:init 
    (pred_4 obj_05 obj_09)
    (pred_4 obj_13 obj_01)
    (pred_6 obj_13)
    (pred_4 obj_02 obj_07)
    (pred_6 obj_02)
    (pred_4 obj_04 obj_10)
    (pred_6 obj_04)
    (pred_3 obj_03)
    (pred_4 obj_03 obj_11)
    (pred_3 obj_12)
    (pred_4 obj_12 obj_11)
    (pred_3 obj_08)
    (pred_4 obj_08 obj_11)
    (pred_5 obj_09 obj_01)
    (pred_5 obj_06 obj_11)
    (pred_5 obj_01 obj_07)
    (pred_5 obj_07 obj_10)
    (pred_5 obj_10 obj_06)
)
 (:goal
  (and
   (pred_2 obj_03)
   (pred_2 obj_12)
   (pred_2 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_03)) (not (pred_2 obj_12))))
    (forall (?m - type_4) (at-most-once (pred_4 ?m obj_09)))
  )
)
)
