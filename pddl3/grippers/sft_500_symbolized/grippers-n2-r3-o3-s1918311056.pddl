(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_09 obj_06 - type_1
obj_03 obj_07 obj_04 obj_05 - type_2
obj_02 obj_10 obj_01 - type_3
obj_08 obj_11 obj_12 - object)
(:init
(pred_1 obj_09 obj_01)
(pred_3 obj_09 obj_03)
(pred_3 obj_09 obj_07)
(pred_1 obj_06 obj_10)
(pred_3 obj_06 obj_04)
(pred_3 obj_06 obj_05)
(pred_2 obj_08 obj_01)
(pred_2 obj_11 obj_02)
(pred_2 obj_12 obj_01)
)
(:goal
(and
(pred_2 obj_08 obj_02)
(pred_2 obj_11 obj_10)
(pred_2 obj_12 obj_02)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_09 obj_02) (pred_1 obj_06 obj_02))))
  )
)
)