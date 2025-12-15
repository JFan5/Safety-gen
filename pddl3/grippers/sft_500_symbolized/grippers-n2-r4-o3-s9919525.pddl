(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_11 obj_03 - type_3
obj_04 obj_01 obj_02 obj_05 - type_1
obj_06 obj_12 obj_09 obj_08 - type_2
obj_10 obj_07 obj_13 - object)
(:init
(pred_2 obj_11 obj_12)
(pred_3 obj_11 obj_04)
(pred_3 obj_11 obj_01)
(pred_2 obj_03 obj_08)
(pred_3 obj_03 obj_02)
(pred_3 obj_03 obj_05)
(pred_4 obj_10 obj_09)
(pred_4 obj_07 obj_09)
(pred_4 obj_13 obj_12)
)
(:goal
(and
(pred_4 obj_10 obj_06)
(pred_4 obj_07 obj_08)
(pred_4 obj_13 obj_08)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_11 obj_08) (pred_2 obj_03 obj_08))))
  )
)
)