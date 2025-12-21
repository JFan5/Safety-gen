(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_07 - type_1
obj_03 obj_11 obj_09 obj_08 - type_2
obj_06 obj_01 obj_10 obj_12 - type_3
obj_13 obj_02 obj_04 - object)
(:init
(pred_1 obj_05 obj_10)
(pred_3 obj_05 obj_03)
(pred_3 obj_05 obj_11)
(pred_1 obj_07 obj_01)
(pred_3 obj_07 obj_09)
(pred_3 obj_07 obj_08)
(pred_2 obj_13 obj_12)
(pred_2 obj_02 obj_01)
(pred_2 obj_04 obj_01)
)
(:goal
(and
(pred_2 obj_13 obj_06)
(pred_2 obj_02 obj_06)
(pred_2 obj_04 obj_06)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_05 obj_06) (pred_1 obj_07 obj_06))))
  )
)
)