(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_02 obj_05 - type_2
obj_12 obj_01 obj_06 obj_13 - type_3
obj_11 obj_07 obj_04 obj_08 - type_1
obj_10 obj_09 obj_03 - object)
(:init
(pred_4 obj_02 obj_07)
(pred_2 obj_02 obj_12)
(pred_2 obj_02 obj_01)
(pred_4 obj_05 obj_11)
(pred_2 obj_05 obj_06)
(pred_2 obj_05 obj_13)
(pred_1 obj_10 obj_04)
(pred_1 obj_09 obj_08)
(pred_1 obj_03 obj_11)
)
(:goal
(and
(pred_1 obj_10 obj_08)
(pred_1 obj_09 obj_08)
(pred_1 obj_03 obj_11)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_02 obj_08) (pred_4 obj_05 obj_08))))
  )
)
)