(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_13 obj_02 - type_1
obj_03 obj_11 obj_04 obj_10 - type_2
obj_09 obj_06 obj_01 obj_08 - type_3
obj_07 obj_05 obj_12 obj_14 - object)
(:init
(pred_1 obj_13 obj_06)
(pred_3 obj_13 obj_03)
(pred_3 obj_13 obj_11)
(pred_1 obj_02 obj_08)
(pred_3 obj_02 obj_04)
(pred_3 obj_02 obj_10)
(pred_2 obj_07 obj_06)
(pred_2 obj_05 obj_09)
(pred_2 obj_12 obj_01)
(pred_2 obj_14 obj_01)
)
(:goal
(and
(pred_2 obj_07 obj_08)
(pred_2 obj_05 obj_08)
(pred_2 obj_12 obj_01)
(pred_2 obj_14 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_13 obj_08) (pred_1 obj_02 obj_08))))
  )
)
)