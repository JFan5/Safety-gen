(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_08 - type_1
obj_13 obj_02 obj_11 obj_07 - type_2
obj_03 obj_04 obj_12 obj_09 - type_3
obj_06 obj_10 obj_01 - object)
(:init
(pred_1 obj_05 obj_12)
(pred_3 obj_05 obj_13)
(pred_3 obj_05 obj_02)
(pred_1 obj_08 obj_04)
(pred_3 obj_08 obj_11)
(pred_3 obj_08 obj_07)
(pred_2 obj_06 obj_04)
(pred_2 obj_10 obj_12)
(pred_2 obj_01 obj_04)
)
(:goal
(and
(pred_2 obj_06 obj_12)
(pred_2 obj_10 obj_03)
(pred_2 obj_01 obj_04)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_05 obj_12) (pred_1 obj_08 obj_12))))
  )
)
)