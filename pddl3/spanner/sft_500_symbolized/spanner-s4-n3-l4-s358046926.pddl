; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 358046926 --problem-name spanner-s4-n3-l4-s358046926
(define (problem spanner-s4-n3-l4-s358046926)
 (:domain spanner)
 (:objects 
     obj_14 - type_3
     obj_10 obj_03 obj_09 obj_07 - type_1
     obj_12 obj_11 obj_08 - type_4
     obj_01 obj_13 obj_06 obj_02 - type_2
     obj_04 obj_05 - type_2
    )
 (:init 
    (pred_1 obj_14 obj_04)
    (pred_1 obj_10 obj_13)
    (pred_2 obj_10)
    (pred_1 obj_03 obj_02)
    (pred_2 obj_03)
    (pred_1 obj_09 obj_01)
    (pred_2 obj_09)
    (pred_1 obj_07 obj_06)
    (pred_2 obj_07)
    (pred_4 obj_12)
    (pred_1 obj_12 obj_05)
    (pred_4 obj_11)
    (pred_1 obj_11 obj_05)
    (pred_4 obj_08)
    (pred_1 obj_08 obj_05)
    (pred_3 obj_04 obj_01)
    (pred_3 obj_02 obj_05)
    (pred_3 obj_01 obj_13)
    (pred_3 obj_13 obj_06)
    (pred_3 obj_06 obj_02)
)
 (:goal
  (and
   (pred_5 obj_12)
   (pred_5 obj_11)
   (pred_5 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_12)) (not (pred_5 obj_11))))
    (forall (?m - type_3) (at-most-once (pred_1 ?m obj_04)))
  )
)
)
