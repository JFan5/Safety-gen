(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_06 obj_04 - type_3
obj_05 obj_09 obj_10 obj_07 - type_2
obj_12 obj_01 obj_08 - type_1
obj_03 obj_11 obj_02 - object)
(:init
(pred_2 obj_06 obj_01)
(pred_1 obj_06 obj_05)
(pred_1 obj_06 obj_09)
(pred_2 obj_04 obj_08)
(pred_1 obj_04 obj_10)
(pred_1 obj_04 obj_07)
(pred_3 obj_03 obj_12)
(pred_3 obj_11 obj_01)
(pred_3 obj_02 obj_12)
)
(:goal
(and
(pred_3 obj_03 obj_08)
(pred_3 obj_11 obj_01)
(pred_3 obj_02 obj_12)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_06 obj_08) (pred_2 obj_04 obj_08))))
  )
)
)