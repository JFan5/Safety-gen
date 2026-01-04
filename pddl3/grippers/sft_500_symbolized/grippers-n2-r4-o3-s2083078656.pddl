(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_02 obj_13 - type_1
obj_05 obj_03 obj_04 obj_11 - type_2
obj_01 obj_08 obj_06 obj_12 - type_3
obj_10 obj_09 obj_07 - object)
(:init
(pred_2 obj_02 obj_12)
(pred_3 obj_02 obj_05)
(pred_3 obj_02 obj_03)
(pred_2 obj_13 obj_08)
(pred_3 obj_13 obj_04)
(pred_3 obj_13 obj_11)
(pred_4 obj_10 obj_08)
(pred_4 obj_09 obj_12)
(pred_4 obj_07 obj_06)
)
(:goal
(and
(pred_4 obj_10 obj_01)
(pred_4 obj_09 obj_08)
(pred_4 obj_07 obj_06)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_02 obj_08) (pred_2 obj_13 obj_08))))
  )
)
)