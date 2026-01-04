(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_01 obj_04 - type_3
obj_06 obj_05 obj_11 obj_02 - type_2
obj_03 obj_07 obj_08 - type_1
obj_10 obj_09 - object)
(:init
(pred_2 obj_01 obj_08)
(pred_3 obj_01 obj_06)
(pred_3 obj_01 obj_05)
(pred_2 obj_04 obj_07)
(pred_3 obj_04 obj_11)
(pred_3 obj_04 obj_02)
(pred_1 obj_10 obj_07)
(pred_1 obj_09 obj_07)
)
(:goal
(and
(pred_1 obj_10 obj_08)
(pred_1 obj_09 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_01 obj_08) (pred_2 obj_04 obj_08))))
  )
)
)