; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1282984999 --problem-name spanner-s3-n2-l4-s1282984999
(define (problem spanner-s3-n2-l4-s1282984999)
 (:domain spanner)
 (:objects 
     obj_02 - type_2
     obj_05 obj_03 obj_10 - type_4
     obj_04 obj_11 - type_1
     obj_06 obj_07 obj_01 obj_08 - type_5
     obj_09 obj_12 - type_5
    )
 (:init 
    (pred_5 obj_02 obj_09)
    (pred_5 obj_05 obj_08)
    (pred_6 obj_05)
    (pred_5 obj_03 obj_01)
    (pred_6 obj_03)
    (pred_5 obj_10 obj_08)
    (pred_6 obj_10)
    (pred_1 obj_04)
    (pred_5 obj_04 obj_12)
    (pred_1 obj_11)
    (pred_5 obj_11 obj_12)
    (pred_2 obj_09 obj_06)
    (pred_2 obj_08 obj_12)
    (pred_2 obj_06 obj_07)
    (pred_2 obj_07 obj_01)
    (pred_2 obj_01 obj_08)
)
 (:goal
  (and
   (pred_3 obj_04)
   (pred_3 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_04)) (not (pred_3 obj_11))))
    (forall (?m - type_2) (at-most-once (pred_5 ?m obj_09)))
  )
)
)
