(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_14 obj_11 - type_1
obj_10 obj_09 obj_08 obj_02 - type_2
obj_04 obj_13 obj_05 obj_06 - type_3
obj_07 obj_12 obj_01 obj_03 - object)
(:init
(pred_1 obj_14 obj_04)
(pred_3 obj_14 obj_10)
(pred_3 obj_14 obj_09)
(pred_1 obj_11 obj_06)
(pred_3 obj_11 obj_08)
(pred_3 obj_11 obj_02)
(pred_2 obj_07 obj_13)
(pred_2 obj_12 obj_13)
(pred_2 obj_01 obj_05)
(pred_2 obj_03 obj_05)
)
(:goal
(and
(pred_2 obj_07 obj_06)
(pred_2 obj_12 obj_06)
(pred_2 obj_01 obj_04)
(pred_2 obj_03 obj_13)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_14 obj_13) (pred_1 obj_11 obj_13))))
    (always (not (and (pred_1 obj_14 obj_06) (pred_1 obj_11 obj_06))))
  )
)
)