(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_12 obj_07 - type_2
obj_09 obj_04 obj_01 obj_05 - type_1
obj_02 obj_08 obj_06 - type_3
obj_11 obj_03 obj_10 - object)
(:init
(pred_2 obj_12 obj_08)
(pred_1 obj_12 obj_09)
(pred_1 obj_12 obj_04)
(pred_2 obj_07 obj_06)
(pred_1 obj_07 obj_01)
(pred_1 obj_07 obj_05)
(pred_4 obj_11 obj_08)
(pred_4 obj_03 obj_02)
(pred_4 obj_10 obj_02)
)
(:goal
(and
(pred_4 obj_11 obj_06)
(pred_4 obj_03 obj_02)
(pred_4 obj_10 obj_06)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_12 obj_06) (pred_2 obj_07 obj_06))))
  )
)
)