; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 395791879 --problem-name spanner-s4-n3-l4-s395791879
(define (problem spanner-s4-n3-l4-s395791879)
 (:domain spanner)
 (:objects 
     obj_09 - type_5
     obj_14 obj_07 obj_04 obj_03 - type_1
     obj_05 obj_08 obj_12 - type_2
     obj_10 obj_13 obj_06 obj_02 - type_3
     obj_01 obj_11 - type_3
    )
 (:init 
    (pred_5 obj_09 obj_01)
    (pred_5 obj_14 obj_10)
    (pred_1 obj_14)
    (pred_5 obj_07 obj_10)
    (pred_1 obj_07)
    (pred_5 obj_04 obj_02)
    (pred_1 obj_04)
    (pred_5 obj_03 obj_06)
    (pred_1 obj_03)
    (pred_4 obj_05)
    (pred_5 obj_05 obj_11)
    (pred_4 obj_08)
    (pred_5 obj_08 obj_11)
    (pred_4 obj_12)
    (pred_5 obj_12 obj_11)
    (pred_6 obj_01 obj_10)
    (pred_6 obj_02 obj_11)
    (pred_6 obj_10 obj_13)
    (pred_6 obj_13 obj_06)
    (pred_6 obj_06 obj_02)
)
 (:goal
  (and
   (pred_3 obj_05)
   (pred_3 obj_08)
   (pred_3 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_05)) (not (pred_3 obj_08))))
    (forall (?m - type_5) (at-most-once (pred_5 ?m obj_01)))
  )
)
)
