(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_07 - type_3
obj_03 obj_08 obj_14 obj_05 - type_2
obj_09 obj_01 obj_13 obj_06 - type_1
obj_04 obj_10 obj_12 obj_02 - object)
(:init
(pred_4 obj_11 obj_01)
(pred_1 obj_11 obj_03)
(pred_1 obj_11 obj_08)
(pred_4 obj_07 obj_06)
(pred_1 obj_07 obj_14)
(pred_1 obj_07 obj_05)
(pred_3 obj_04 obj_06)
(pred_3 obj_10 obj_13)
(pred_3 obj_12 obj_06)
(pred_3 obj_02 obj_13)
)
(:goal
(and
(pred_3 obj_04 obj_06)
(pred_3 obj_10 obj_09)
(pred_3 obj_12 obj_06)
(pred_3 obj_02 obj_01)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_11 obj_13) (pred_4 obj_07 obj_13))))
  )
)
)