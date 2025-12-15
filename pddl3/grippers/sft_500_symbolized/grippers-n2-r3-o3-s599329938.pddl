(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_05 obj_07 - type_3
obj_06 obj_01 obj_02 obj_10 - type_2
obj_04 obj_09 obj_12 - type_1
obj_08 obj_03 obj_11 - object)
(:init
(pred_4 obj_05 obj_12)
(pred_2 obj_05 obj_06)
(pred_2 obj_05 obj_01)
(pred_4 obj_07 obj_09)
(pred_2 obj_07 obj_02)
(pred_2 obj_07 obj_10)
(pred_1 obj_08 obj_04)
(pred_1 obj_03 obj_04)
(pred_1 obj_11 obj_09)
)
(:goal
(and
(pred_1 obj_08 obj_04)
(pred_1 obj_03 obj_12)
(pred_1 obj_11 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_05 obj_12) (pred_4 obj_07 obj_12))))
  )
)
)