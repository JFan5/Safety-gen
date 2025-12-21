(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_09 obj_05 - type_1
obj_04 obj_03 obj_07 obj_10 - type_2
obj_08 obj_12 obj_02 - type_3
obj_06 obj_01 obj_11 - object)
(:init
(pred_1 obj_09 obj_12)
(pred_3 obj_09 obj_04)
(pred_3 obj_09 obj_03)
(pred_1 obj_05 obj_02)
(pred_3 obj_05 obj_07)
(pred_3 obj_05 obj_10)
(pred_2 obj_06 obj_08)
(pred_2 obj_01 obj_02)
(pred_2 obj_11 obj_02)
)
(:goal
(and
(pred_2 obj_06 obj_02)
(pred_2 obj_01 obj_08)
(pred_2 obj_11 obj_02)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_09 obj_02) (pred_1 obj_05 obj_02))))
  )
)
)