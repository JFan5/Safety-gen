(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_03 obj_02 - type_1
obj_11 obj_10 obj_09 obj_12 - type_3
obj_13 obj_05 obj_08 obj_06 - type_2
obj_01 obj_04 obj_07 - object)
(:init
(pred_2 obj_03 obj_06)
(pred_1 obj_03 obj_11)
(pred_1 obj_03 obj_10)
(pred_2 obj_02 obj_05)
(pred_1 obj_02 obj_09)
(pred_1 obj_02 obj_12)
(pred_4 obj_01 obj_13)
(pred_4 obj_04 obj_05)
(pred_4 obj_07 obj_08)
)
(:goal
(and
(pred_4 obj_01 obj_08)
(pred_4 obj_04 obj_06)
(pred_4 obj_07 obj_06)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_03 obj_06) (pred_2 obj_02 obj_06))))
  )
)
)