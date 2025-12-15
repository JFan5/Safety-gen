; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 861351485 --problem-name spanner-s4-n3-l4-s861351485
(define (problem spanner-s4-n3-l4-s861351485)
 (:domain spanner)
 (:objects 
     obj_02 - type_1
     obj_05 obj_03 obj_09 obj_14 - type_5
     obj_07 obj_11 obj_08 - type_4
     obj_01 obj_13 obj_06 obj_10 - type_2
     obj_04 obj_12 - type_2
    )
 (:init 
    (pred_1 obj_02 obj_04)
    (pred_1 obj_05 obj_01)
    (pred_6 obj_05)
    (pred_1 obj_03 obj_01)
    (pred_6 obj_03)
    (pred_1 obj_09 obj_10)
    (pred_6 obj_09)
    (pred_1 obj_14 obj_13)
    (pred_6 obj_14)
    (pred_3 obj_07)
    (pred_1 obj_07 obj_12)
    (pred_3 obj_11)
    (pred_1 obj_11 obj_12)
    (pred_3 obj_08)
    (pred_1 obj_08 obj_12)
    (pred_5 obj_04 obj_01)
    (pred_5 obj_10 obj_12)
    (pred_5 obj_01 obj_13)
    (pred_5 obj_13 obj_06)
    (pred_5 obj_06 obj_10)
)
 (:goal
  (and
   (pred_4 obj_07)
   (pred_4 obj_11)
   (pred_4 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_07)) (not (pred_4 obj_11))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_04)))
  )
)
)
