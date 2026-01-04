(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_07 obj_01 - type_3
obj_04 obj_06 obj_12 obj_02 - type_1
obj_08 obj_10 obj_05 - type_2
obj_11 obj_09 obj_03 - object)
(:init
(pred_3 obj_07 obj_08)
(pred_2 obj_07 obj_04)
(pred_2 obj_07 obj_06)
(pred_3 obj_01 obj_10)
(pred_2 obj_01 obj_12)
(pred_2 obj_01 obj_02)
(pred_1 obj_11 obj_10)
(pred_1 obj_09 obj_10)
(pred_1 obj_03 obj_08)
)
(:goal
(and
(pred_1 obj_11 obj_08)
(pred_1 obj_09 obj_10)
(pred_1 obj_03 obj_08)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_07 obj_08) (pred_3 obj_01 obj_08))))
  )
)
)