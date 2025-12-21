(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_04 - type_1
obj_02 obj_03 obj_01 obj_06 - type_2
obj_09 obj_08 obj_11 obj_13 - type_3
obj_07 obj_05 obj_12 - object)
(:init
(pred_1 obj_10 obj_08)
(pred_3 obj_10 obj_02)
(pred_3 obj_10 obj_03)
(pred_1 obj_04 obj_09)
(pred_3 obj_04 obj_01)
(pred_3 obj_04 obj_06)
(pred_2 obj_07 obj_11)
(pred_2 obj_05 obj_13)
(pred_2 obj_12 obj_09)
)
(:goal
(and
(pred_2 obj_07 obj_13)
(pred_2 obj_05 obj_13)
(pred_2 obj_12 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_10 obj_13) (pred_1 obj_04 obj_13))))
  )
)
)